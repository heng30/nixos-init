#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import subprocess

dataList = []

def coinPrice(coins):
    for coin in coins:
        url = "https://api.alternative.me/v2/ticker/" + coin["name"] + "/"
        try:
            result = subprocess.run(["curl", url],capture_output=True, text=True)
            data = json.loads(result.stdout)
            dataList.append(
                str(round(data["data"][coin["id"]]["quotes"]["USD"]["price"]))
            )

            percentage = (
                str(
                    round(
                        data["data"][coin["id"]]["quotes"]["USD"][
                            "percentage_change_24h"
                        ]
                    )
                )
                + "%"
            )

            if len(percentage) == 2:
                percentage = '+' + percentage

            dataList.append(percentage)
        except Exception:
            dataList.append(" 0")
            dataList.append("0%")


def fear():
    url = "https://api.alternative.me/fng/?limit=2"
    try:
        r = subprocess.run(["curl",url], capture_output=True, text=True)
        data = json.loads(r.stdout)
        for j in data["data"]:
            dataList.append(str(j["value"]))
    except Exception:
        dataList.append(" 0")
        dataList.append(" 0")


if __name__ == "__main__":
    coinPrice([{"name": "bitcoin", "id": "1"}, {"name": "ethereum", "id": "1027"}])

    fear()

    print(" ".join(dataList))
