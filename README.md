# 平均計算スクリプト (VBScript)

## Description

中身が同形 (データ構成が同じ) である複数の CSV ファイルを、
各要素ごとに平均を取り、
1 つの CSV ファイルに書き出すだけの非常にシンプルなスクリプト。


## Requirements

VBScript で書かれているため、Windows 環境。


## Usage

例えば、コマンドプロンプトであれば

> CScript calc-mean.vbs <output> <input-1> <input-2> ... <inpput-n>

のように実行すればよい。

sample フォルダをダウンロードし、そこに calc-mean.vbs を放り込み、calc-mean.cmd を実行すればどうなるかわかるはず。 (data-sample-1.csv, data-sample-2.csv, data-sample-3.csv を統合したファイルが output.csv として現れるはず。)


## Author

tag (Twitter: [@tag_ism](https://twitter.com/tag_ism "tag (@tag_ism) | Twitter") / Blog: http://karat5i.blogspot.jp/)
