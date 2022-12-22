# Drawers

In order to make the default Flutter **`Drawer`** widget adhere to the Material Design specifications, following patches were needed:

- A custom **`MarginedRoundedRectangleBorder`** was applied to every **`ListTile`** in the **`Drawer`** widget, in order to make the **`ListTile`** selection background have the correct spacing and border radius.
- The **`DividerTheme`** was changed to have a **`thickness`** of 1.0.

---

