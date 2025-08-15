# Hypergate Operator

##### Description
The Hypergate operator automatically defines a one vs. rest labelling of cytometry data. It analyzes expression values across markers to define a gate that would describe a population of interest defined by the user.

This operator is a wrapper for the [hypergate R package](https://cran.r-project.org/web/packages/hypergate/index.html) (version 0.8.5).

##### Usage
Input projection|.
---|---
`row`        | represents the variables (markers)
`column`     | represents the observations (cells/events)
`y-axis`     | represents the measurement values

Input parameters|.
---|---
`high_expression`        | numeric, quantile threshold for highly expressed markers, default is 0.7
`low_expression`        | numeric, quantile threshold for lowly expressed markers, default is 0.3
`expressed_marker`        | string, comma-separated list of markers that should be highly expressed, default is ""
`not_expressed_marker`        | string, comma-separated list of markers that should be lowly expressed, default is ""

Output relations|.
---|---
`hypergate_member`        | numeric, 1 if the event is inside the hypergate, 0 if outside

##### Details
The operator takes the following steps:
1. Identifies a population of interest based on marker expression thresholds
2. Applies the hypergate algorithm to find an optimal hyperrectangular gate
3. Returns gate membership for each event

The population of interest is defined by:
- Events with expression values above the `high_expression` quantile for markers listed in `expressed_marker`
- Events with expression values below the `low_expression` quantile for markers listed in `not_expressed_marker`

At least one marker must be specified in either `expressed_marker` or `not_expressed_marker`.

##### References
- [Hypergate R package](https://cran.r-project.org/web/packages/hypergate/index.html)
- Becht, E., Simoni, Y., Coustan-Smith, E. et al. Reverse-engineering flow-cytometry gating strategies for phenotypic labelling and high-performance cell sorting. Nat Biotechnol 39, 529–539 (2021). https://doi.org/10.1038/s41587-020-00744-z

##### See Also
[template_R_operator](https://github.com/tercen/template_R_operator)