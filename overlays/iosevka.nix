self: pkgs:

{
  iosevka-slab = pkgs.iosevka.override {
    design = [
      "slab"
      "ligset-coq"
      "termlig"
      "v-asterisk-low"
      "v-at-long"
      "v-caret-low"
      "v-dollar-open"
      "v-paragraph-low"
      "v-underscore-low"
      "v-zero-dotted"
    ];
    family = "Iosevka Slab";
    set = "slab";
  };
}