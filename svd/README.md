# svd

- CMSIS-SVD.xsd is downloaded from https://github.com/ARM-software/CMSIS_5/blob/develop/CMSIS/Utilities/CMSIS-SVD.xsd
- vendor/ is extracted from MRS V182

## SVD files

- ch32v3xx shares the same svd
- ch32v2xx shares the same svd
- ch32f2xx shares the same svd

```
MD5 (CH32F103xx.svd) = 794da8312c831c74c3042da163138d68
MD5 (CH32F203xx.svd) = 372f6a658e9e3cfd970c389b2832c0ec
MD5 (CH32F205xx.svd) = 372f6a658e9e3cfd970c389b2832c0ec
MD5 (CH32F207xx.svd) = 372f6a658e9e3cfd970c389b2832c0ec
MD5 (CH32F208xx.svd) = 372f6a658e9e3cfd970c389b2832c0ec
MD5 (CH32V003xx.svd) = 4099b5f6ca9f25c2a73bb6b92f3a45de
MD5 (CH32V103xx.svd) = 6da7f70bb75c8af9ecc8a42489b1915e
MD5 (CH32V203xx.svd) = a42761db322c0ace3cdbd0c0eb06dca9
MD5 (CH32V208xx.svd) = a42761db322c0ace3cdbd0c0eb06dca9
MD5 (CH32V303xx.svd) = 382a9f4b770cc84eddf43369e99af219
MD5 (CH32V305xx.svd) = 382a9f4b770cc84eddf43369e99af219
MD5 (CH32V307xx.svd) = 382a9f4b770cc84eddf43369e99af219
MD5 (CH56Xxx.svd) = efb0df3fd5f109ce9f16f5a166c0b3f7
MD5 (CH57Xxx.svd) = 2bbd4038a2bc05f81c02370e8ba25436
MD5 (CH58Xxx.svd) = 5e3f36119397397e0c4ee1b186f242c5
```

## Format Fixes

- read/clear => read-write
- read-only or write-only => read-write
- write-only or read-only => read-write
- read-opnly => read-only
- write-read => read-write
- Read or Write 1 to Clear => read-write
- RE: ">[ ]+" => ">"
- move `<access>` below `<bitWidth>`
- move `<size>` below `<addressOffset>`
- read-only_write-only ???
- /RB_ => __RB_ ???