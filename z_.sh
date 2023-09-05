#!/bin/bash

# 输入文件名
input_file="your_file.txt"

# 计数器，用于生成输出文件名
counter=0

# 初始化标志变量
inside_block=0

while IFS= read -r line; do
  if [[ $line == "module"* ]]; then
    # 开始新块，递增计数器
    ((counter++))
    inside_block=1
    # 打开新的输出文件
    output_file="module_$counter.txt"
    echo "$line" > "$output_file"
  elif [[ $line == "endmodule"* ]]; then
    if [ $inside_block -eq 1 ]; then
      # 关闭当前输出文件
      echo "$line" >> "$output_file"
      inside_block=0
    fi
  else
    if [ $inside_block -eq 1 ]; then
      # 写入当前块的内容到输出文件
      echo "$line" >> "$output_file"
    fi
  fi
done < "$input_file"