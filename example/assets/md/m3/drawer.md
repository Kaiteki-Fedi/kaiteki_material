# Drawers

In order to make the default Flutter **`Drawer`** widget adhere to the Material Design 3 specifications, following patches were needed:

- A custom **`MarginedStadiumBorder`** was applied to every **`ListTile`** in the **`Drawer`** widget, in order to make the **`ListTile`** selection background have the correct spacing and border radius.
- The **`DividerTheme`** was changed to have a **`thickness`** of 1.0.

---

## TODO

- Flutter does not have the updated Material icons, so only close approximates were used. [#99973](https://github.com/flutter/flutter/issues/99973)