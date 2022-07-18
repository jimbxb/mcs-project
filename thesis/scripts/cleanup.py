import csv
from collections import defaultdict
from functools import partial
import pprint
import re
from math import *
import sys
from scipy import stats
import numpy


def alphabetise(i:int):
    s = ""
    i += 1
    while i > 0:
        i -= 1
        s += chr(ord("A") + i % 26)
        i //= 26
    return s[::-1]

def format(x):
    if type(x) is float or type(x) is numpy.float64:
        if isnan(x): return ""
        return f"{x:f}"
    return str(x)

def clean_name(name:str):
    return " ".join(map(str.capitalize, re.split(r"[_ -]", name)))

def clean_data(data:list):
    [name, clss, *rest] = data
    return [clean_name(name.split("/")[-1].split(".")[0]), clss] + rest

def group_data(data:list):
    groups = defaultdict(dict)
    for [prog, clss, *rest] in data:
        groups[prog][clss] = list(map(eval, rest))
    return groups

def clean_file(meta:tuple):
    with open(meta["file"], "r") as fp:
        data = csv.reader(fp)
        cleaned_data = list(map(clean_data, data))
        sorted_data = sorted(cleaned_data, key=meta["ord"])
    
    with open(meta["clean"], "w") as fp:
        fp.write("prog,class,")
        if type(meta["labels"]) == list:
            fp.write(",".join(meta["labels"]))
        else:
            fp.write(",".join(meta["labels"] + alphabetise(i) 
                             for i in range(len(sorted_data[0]) - 2)))
        fp.write("\n" + "\n".join(map(",".join, sorted_data)))

    if "transforms" in meta:
        transformed = group_data(cleaned_data)

        if "additional" in meta:
            for label, add in meta["additional"].items():
                for prog in transformed:
                    transformed[prog][label] = add(prog)

        for label, trans in meta["transforms"].items(): 
            for prog, row in transformed.items():
                transformed[prog][label] = trans(row)

        with open(meta["trans"], "w") as fp:
            keys = (list(meta["additional"].keys()) if "additional" in meta else []) + \
                    list(meta["transforms"].keys())                    
            fp.write("prog," + ",".join(keys) + "\n")
            for prog, row in transformed.items():
                fp.write(f"{prog},{','.join(map(format, [row[key] for key in keys]))}\n")

def order_key(names, x): return (x[0], names.index(x[1]))

def raw(label, index, data):
    if index is not None: return data[label][index]
    return data[label]

def raws(cols, label, tag): 
    return {
        f"{tag}-{col}": partial(raw, label, i) 
        for i, col in enumerate(cols)
    }

def mean(label, data): 
    return stats.tmean(data[label])

def median(label, data): 
    return numpy.median(data[label])

def diff(old, bench, data): 
    return (data[bench] / data[old] - 1) * 100

def stddev(label, data): 
    return stats.tstd(data[label])

def t_test_p(l1, l2, data): 
    return stats.ttest_ind(data[l2], data[l1], equal_var=False).pvalue

def basic(names, prefix):
    old, new = names
    return { 
        k: v for d in [{
            f"{prefix}old-{metric}" : partial(func, old),
            f"{prefix}new-{metric}" : partial(func, new),
            f"delta-{prefix}new-{metric}" : partial(diff, f"{prefix}old-{metric}", f"{prefix}new-{metric}"),
            f"delta-{prefix}old-{metric}" : lambda _: float("nan")
        } for metric, func in {"mean": mean, "median": median}.items()]
        for k, v in d.items()
    } | { 
        f"{prefix}{infix}-stddev": partial(stddev, names[idx])
        for idx, infix in enumerate(["old", "new"])
    } | { 
        f"{prefix}p-value": partial(t_test_p, old, new)
    }


RESOURCES = ["Parameters", "Globals"]

ORDERS = ["First", "Higher"]

DIR = (sys.argv + ["data"])[1]

SIZE_LABELS = ["obj", "exe", "sloc"]

HO_COUNTS = {
    "Fibs":        903,
    "Sort":        25413807,
    "N Body":      105000005,
    "Knapsack":    500200,
    "Mandlebrot":  173912082,
    "Sonar Sweep": 39760695
}

META = [
    {
        "file": f"{DIR}/size-resources.csv",
        "clean": f"{DIR}/size-resources-clean.csv",
        "trans": f"{DIR}/size-resources-trans.csv",
        "ord": partial(order_key, RESOURCES),
        "labels": SIZE_LABELS,
        "transforms": raws(SIZE_LABELS, "Parameters", "old")
                    | raws(SIZE_LABELS, "Globals", "new")
                    | { f"{label}-diff": partial(diff, f"old-{label}", f"new-{label}")
                        for label in SIZE_LABELS }
    }, 
    {
        "file": f"{DIR}/size-order.csv",
        "clean": f"{DIR}/size-order-clean.csv",
        "trans": f"{DIR}/size-order-trans.csv",
        "ord": partial(order_key, ORDERS),
        "labels": SIZE_LABELS,
        "transforms": raws(SIZE_LABELS, "First", "old")
                    | raws(SIZE_LABELS, "Higher", "new")
                    | { f"{label}-diff": partial(diff, f"old-{label}", f"new-{label}")
                        for label in SIZE_LABELS }
    }, 
    {
        "file": f"{DIR}/time-resources.csv",
        "clean": f"{DIR}/time-resources-clean.csv",
        "trans": f"{DIR}/time-resources-trans.csv",
        "ord": partial(order_key, RESOURCES),
        "labels": "time",
        "additional": { "call-count": lambda _: float("nan") },
        "transforms": basic(RESOURCES[:2], "") 
    }, 
    {
        "file": f"{DIR}/time-order.csv",
        "clean": f"{DIR}/time-order-clean.csv",
        "trans": f"{DIR}/time-order-trans.csv",
        "ord": partial(order_key, ORDERS),
        "labels": "time",
        "additional": { "call-count": HO_COUNTS.get },
        "transforms": basic(ORDERS[:2], "")
    }
]

if __name__ == "__main__":
    for meta in META:
        clean_file(meta)
