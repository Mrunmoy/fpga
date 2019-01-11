# PYNQ-Z2 Bring-Up Guide

This repo shows my first steps bringing up my [Tul PYNQ-Z2](https://www.tulembedded.com/fpga/ProductsPYNQ-Z2.html) board with the [official PYNQ image](https://dpoauwgwqsy2x.cloudfront.net/Download/pynq_z2_v3.0.1.zip), verifying PS–PL works, and running a custom fun LED blink pattern!

---

## What I did

1. Downloaded the official PYNQ-Z2 image.
2. Flashed it to a 16GB microSD card using Balena Etcher.
3. Booted the board and connected via UART & Ethernet.
4. Verified network & Jupyter Notebook.
5. Loaded the `base` overlay and ran my own Python LED blink notebook.

---

## Notebooks

- `fun_led_blink.ipynb`: simple Python notebook to test PS–PL LED control with a custom blink pattern.

---

## Screenshots
- [Putty boot log and ifconfig](screenshots/PuttyBootLog.png)
- [Jupyter Main Page](screenshots/JupyterMainPage.png)
- [Getting Started IPhython page](screenshots/GettingStartedPage.png)
- [Upload your script](screenshots/UploadToJupyter.png)


## Reference:
[Pynq Official docs](https://pynq.readthedocs.io/en/latest/pynq_sd_card.html)
[Zynq TRM](https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM)

---
## License

MIT
