def logarithmic():
    total = 0
    for i in range(128):
        total += 4.8 + i * 0.2197
    return total

print(logarithmic())