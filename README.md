# ch32-rs

Embedded Rust device crates for WCH's RISC-V and Cortex-M microcontrollers.

## Roadmap

- [ ] Support GD32V3x/GD32V2x family
- [ ] Support GD32V103x family
- [ ] CHxxx interface or BLE MCUs.
- [ ] Cortex-M MCUs.

## MCU list

- [32-bit General Purpose RISC-V](http://www.wch-ic.com/products/categories/47.html?pid=5)
- [32-bit General Purpose Cortex-M3](http://www.wch-ic.com/products/categories/66.html?pid=5)
- [32-bit High-speed Interface MCU, RISC-V or Unmentioned](http://www.wch-ic.com/products/categories/67.html?pid=5)
- [32-bit BLE MCU, RISC-V or Coretex-M](http://www.wch-ic.com/products/categories/68.html?pid=5)

**NOTE**: Will never support of 8-bit MCUs.

## RISC-V

- CH32V103x
- CH32V203x 采用青稞 V4B 内核, 支持硬件中断堆栈
- CH32V208x 采用青稞 V4C 内核, 进一步加快硬件除法运算速度，并增加了内存保护功能
- CH32V303x/305x/307x 采用青稞 V4F 内核，进一步支持了硬件浮点运算

### SVD files

For RISC-V, 2 SVD files are enough to cover CH32V103x, CH32V2x and CH32V3x family MCUs:

- CH32V20x = CH32V30x (share the same RM datasheet)
- CH32V303xx.svd = CH32V305xx.svd
- CH32V103xx.svd