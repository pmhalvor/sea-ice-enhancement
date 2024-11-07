# 🌊❄️🔍 Sea Ice Enhancement (SIC-SR)
ML pipeline to augment high-resolution sea ice contentraction (SIC) data to low resolution training inputs to then fine tune a SIC super-resolution model. 

# Goal 
Take high resolution SIC data, corrupt it, then train a model to recover the original high resolution data.
Before augmenting the HR data, we need to define and isolate land mass masks. These areas, including their borders, should not be augmented.

## Augmentation techniques
* Mean filter convolution
* Gaussian noise convolution
* “Sharpen” (sigmoid filter or similar to emphasize extremes)
* Any random combination of the above 
    * Select number between 0 and 1
    * If number within threshold for that augmentation, apply it with number as parameter

## Data
* NSIDC data: https://nsidc.org/data/search#keywords=sea+ice/sortKeys=scoredesc/facetFilters=%257B%257D/pageNumber=1/itemsPerPage=25
