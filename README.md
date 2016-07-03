[![Build Status](https://travis-ci.org/LaDilettante/vietnamcode.svg?branch=master)](https://travis-ci.org/LaDilettante/vietnamcode)
[![codecov](https://codecov.io/gh/LaDilettante/vietnamcode/branch/master/graph/badge.svg)](https://codecov.io/gh/LaDilettante/vietnamcode)

# Usage

Use the main function `vietnamcode` to convert Vietnam's provinces' names and ID across different formats. The function can handle diacritics and various spellings.

```
source <- "HCMC"
vietnamcode::vietnamcode(source, "province_name", "province_name")
vietnamcode::vietnamcode(source, "province_name", "pci")
vietnamcode::vietnamcode(source, "province_name", "enterprise_census")
```

# Installation

```
devtools::install_github("LaDilettante/vietnamcode")
```
