import torch

print(torch.__version__)
print(torch.cuda.is_available())

if torch.cuda.is_available():
    device = torch.device("cuda")          # 使用 GPU
else:
    device = torch.device("cpu")           # 使用 CPU

print(device)


# nvidia-smi

