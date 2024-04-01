# ch32-rs - WCH's CH32 Peripheral Access Crates

[![crates.io](https://img.shields.io/crates/v/ch32v0.svg?label=ch32v0)](https://crates.io/crates/ch32v0)
[![crates.io](https://img.shields.io/crates/v/ch32v1.svg?label=ch32v1)](https://crates.io/crates/ch32v1)
[![crates.io](https://img.shields.io/crates/v/ch32v2.svg?label=ch32v2)](https://crates.io/crates/ch32v2)
[![crates.io](https://img.shields.io/crates/v/ch32v3.svg?label=ch32v3)](https://crates.io/crates/ch32v3)
[![crates.io](https://img.shields.io/crates/v/ch32x0.svg?label=ch32x0)](https://crates.io/crates/ch32x0)
[![crates.io](https://img.shields.io/crates/v/ch32l1.svg?label=ch32l1)](https://crates.io/crates/ch32l1)

[![crates.io](https://img.shields.io/crates/v/ch56x.svg?label=ch56x)](https://crates.io/crates/ch56x)
[![crates.io](https://img.shields.io/crates/v/ch57x.svg?label=ch57x)](https://crates.io/crates/ch57x)
[![crates.io](https://img.shields.io/crates/v/ch58x.svg?label=ch58x)](https://crates.io/crates/ch58x)
[![crates.io](https://img.shields.io/crates/v/ch59x.svg?label=ch59x)](https://crates.io/crates/ch59x)
[![crates.io](https://img.shields.io/crates/v/ch641.svg?label=ch641)](https://crates.io/crates/ch641)
[![crates.io](https://img.shields.io/crates/v/ch643.svg?label=ch643)](https://crates.io/crates/ch643)

---

Embedded Rust device crates for WCH's RISC-V and Cortex-M(planned) microcontrollers.

> **Note**
> This project is not affiliated with WCH. This is a hobby project.

## Alternatives to PAC crates

The ch32-rs team also working on a unified "metapac" solution for all WCH's MCUs, using metadata to generate an "all-in-one" PAC crate.
It's still in early stage, but you can check it out at [ch32-rs/ch32-data](https://github.com/ch32-rs/ch32-data) and
[ch32-rs/ch32-metapac](https://github.com/ch32-rs/ch32-metapac).

## HAL crates

- [ch58x-hal](https://github.com/ch32-rs/ch58x-hal) - embassy, gpio, spi, i2c, ble
- [ch32x0-hal](https://github.com/ch32-rs/ch32x0-hal) - embassy, gpio
- [ch59x-hal](https://github.com/ch32-rs/ch59x-hal) - early stage, ch58x-hal can be used with very minor changes
- ch57x-hal - planning, ch58x-hal can be used with very minor changes
- [ch32v00x-hal](https://github.com/ch32-rs/ch32v00x-hal) - early stage, requires nightly rust for RV32EC support
- [ch32-hal](https://github.com/ch32-rs/ch32-hal) - wip unified hal for all WCH's MCUs

## Runtime Support

- [qingke, qingke-rt](https://github.com/ch32-rs/qingke)
- [wchble](https://github.com/ch32-rs/wchble) - planning

## Roadmap

- [x] Toolchains for Flashing and Debugging
  - [x] [wchisp](https://github.com/ch32-rs/wchisp) for USB-ISP
  - [x] [wlink](https://github.com/ch32-rs/wlink) for WCH-Link probe
  - [x] [probe-rs support](https://github.com/probe-rs/probe-rs/pull/1437)
    - [x] [CH32V003 support](https://github.com/probe-rs/probe-rs/pull/1876)
    - [x] [CH32V307 support](https://github.com/probe-rs/probe-rs/pull/2136), should work with CH32V20x too
    - [x] [flash-algorithms](https://github.com/ch32-rs/flash-algorithms)
    - [ ] Support other families
- [ ] HAL crates
  - [x] Support CH32V3x/CH32V2x family
  - [x] Support CH32V103 family
  - [x] Support CH32V003 family, [ch32v00x-hal](https://github.com/ch32-rs/ch32v00x-hal)
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

### RISC-V

Nick name: "赤菟"(Chitu). IP Core brand: 青稞(Qingke). V2A, V3A, V4A, V4B, V4C, V4F.

- CH32V003: Qingke-V2A
- CH32V103: Qingke-V3A
- CH32V203: Qingke-V4B
- CH32V208: Qingke-V4C, BLE
- CH32V30x: Qingke-V4F
- CH32L103 Qingke-V4C, Low power
- CH32X03x: Qingke-V4C, USB PD, PIOC
- CH56x: Qingke-V3A, USB 3.0 SS
- CH571, CH573: Qingke-V3A, BLE 4.2
- CH58x: Qingke-V4A, BLE 5.3
- CH59x: Qingke-V4C, BLE 5.4
- CH641: Qingke-V2A, USB PD
- CH643: Qingke-V4C RGB/LED/PWM, PIOC, USB PD
- CH645: Qingke-V4C, USB PD + USB HS

### Cortex-M

CH32F uses Cortex-M3.
CH577/CH578/CH579 uses Cortex-M0.

- CH32F103
- CH32F203
- CH32F205
- CH32F207
- CH32F208, BLE 5.3
- CH577/CH578/CH579, BLE 4.2

## Toolchain

- [MRS: MounRiver Studio](http://www.mounriver.com/)
  - Precompiled binary of OpenOCD is included in MRS(Windows, Linux, and macOS)
  - WCH-LinkUtility is included in MRS
  - WCHISPTool is included in MRS
- [Official Flash Tool: NanjingQinheng/WCH-Link](https://github.com/NanjingQinheng/WCH-Link)
- [OpenOCD fork with WCH-Link support(wlink)](https://github.com/jiegec/riscv-openocd/tree/wch)
  - Buggy, compatible with WCH-Link 2.3
- [ch32-rs/wchisp](https://github.com/ch32-rs/wchisp)
- [ch32-rs/wlink](https://github.com/ch32-rs/wlink)

## Ref

- <https://github.com/openwch>
