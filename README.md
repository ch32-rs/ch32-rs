# ch32-rs - WCH's CH32 Peripheral Access Crates

[![crates.io](https://img.shields.io/crates/v/ch32v0.svg?label=ch32v0)](https://crates.io/crates/ch32v0)
[![crates.io](https://img.shields.io/crates/v/ch32v1.svg?label=ch32v1)](https://crates.io/crates/ch32v1)
[![crates.io](https://img.shields.io/crates/v/ch32v2.svg?label=ch32v2)](https://crates.io/crates/ch32v2)
[![crates.io](https://img.shields.io/crates/v/ch32v3.svg?label=ch32v3)](https://crates.io/crates/ch32v3)
[![crates.io](https://img.shields.io/crates/v/ch56x.svg?label=ch56x)](https://crates.io/crates/ch56x)
[![crates.io](https://img.shields.io/crates/v/ch57x.svg?label=ch57x)](https://crates.io/crates/ch57x)
[![crates.io](https://img.shields.io/crates/v/ch58x.svg?label=ch58x)](https://crates.io/crates/ch58x)

Embedded Rust device crates for WCH's RISC-V and Cortex-M microcontrollers.

## Roadmap

- [x] Support CH32V3x/CH32V2x family
- [x] Support CH32V103 family
- [ ] Support CH32V003 family (RV32EC is not supported by Rust)
- [ ] Toolchains
  - [x] [wchisp](https://github.com/ch32-rs/wchisp) for Linux/macOS/Windows
  - [ ] [probe-rs + WCH-Link, WIP...](https://github.com/probe-rs/probe-rs/pull/1437)
- [ ] HAL crate for CH32V3x/CH32V2x family
  - <https://github.com/ch32-rs/ch32v20x-hal> WIP...
- [ ] HAL crate for CH32V103x family
- [ ] CHxxx interface or BLE MCUs.
- [ ] Cortex-M MCUs.

## Development

```shell
# Do not use rust version of svdtools
pip install svdtools

# install xmlint

cargo install svd2rust

./scripts/generate.sh && ./scripts/update.sh
```

## MCU list

- [32-bit General Purpose RISC-V](http://www.wch-ic.com/products/categories/47.html?pid=5)
- [32-bit General Purpose Cortex-M3](http://www.wch-ic.com/products/categories/66.html?pid=5)
- [32-bit High-speed Interface MCU, RISC-V or Unmentioned](http://www.wch-ic.com/products/categories/67.html?pid=5)
- [32-bit BLE MCU, RISC-V or Coretex-M](http://www.wch-ic.com/products/categories/68.html?pid=5)

**NOTE**: Will never support 8-bit MCUs.

### Subdivision

- D6: Low-and-medium-density general
- D8: High-density general
- D8C: Connectivity or interconnectivity
- D8W: Wireless

### RISC-V

Nick name: "赤菟"(Chitu). IP Core brand: 青稞(Qingke).

- CH32V103x Qingke-V3A RV32IMAC
- CH32V203x Qingke-V4B Hardware Interrupt stack
- CH32V208x Qingke-V4C Hardware division, memory protect
- CH32V303x/305x/307x Qingke-V4F Hardware floating point
- CH56x: RISC-V3A
- CH571, CH573: RISC-V3A BLE
- CH58x: RISC-V3A BLE

```
CH32V20x_D6: CH32V203F6, CH32V203G6, CH32V203K6, CH32V203K8, CH32V203C6 and CH32V203C8. CH32V20x_D8: CH32V203RB.
CH32V20x_D8W: CH32V208GB, CH32V208CB, CH32V208RB and CH32V208WB.
CH32V30x_D8: CH32V303CB, CH32V303RB, CH32V303RC and CH32V303VC.
CH32V30x_D8C: CH32V305FB, CH32V305RB, CH32V307RC, CH32V307WC and CH32V307VC.
```

### Cortex-M

```
CH32F20x_D6: CH32F203K8, CH32F203C6 and CH32F203C8.
CH32F20x_D8: CH32F203CB, CH32F203RC and CH32F203VC.
CH32F20x_D8C: CH32F205RB and CH32F207VC.
CH32F20x_D8W: CH32F208RB and CH32F208WB.
```

## Toolchain

- [MRS: MounRiver Studio](http://www.mounriver.com/)
  - Precompiled binary of OpenOCD is included in MRS(Windows, Linux, and macOS)
  - But it requires WCH-Link to be force upgraded to 2.7
- [Official Flash Tool: NanjingQinheng/WCH-Link](https://github.com/NanjingQinheng/WCH-Link)
- [OpenOCD fork with WCH-Link support(wlink)](https://github.com/jiegec/riscv-openocd/tree/wch)
  - Buggy, compatible with WCH-Link 2.3
- [ch32-rs/wchisp](https://github.com/ch32-rs/wchisp)

## Ref

- https://github.com/openwch
