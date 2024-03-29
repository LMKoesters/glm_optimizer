% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ModelOptimizer.R
\name{optimize_model}
\alias{optimize_model}
\title{Parent function for model optimization}
\usage{
optimize_model(
  df,
  resp_preds,
  glm_family = "binomial",
  autocorrelation_threshold = 0.8,
  automatic_removal = FALSE,
  round_p = 5,
  plot = FALSE,
  aic_bic = FALSE,
  correlation_method = "spearman",
  model_summaries = FALSE,
  glm_iter = 1000
)
}
\arguments{
\item{df}{A (wide) dataframe with predictors and response as columns}

\item{resp_preds}{A dictionary of response columns and respective predictors sorted by their relevance (most to least)}

\item{glm_family}{The family used for glm calculation}

\item{autocorrelation_threshold}{The threshold deciding (together with the p-values) whether two variables are autocorrelated}

\item{automatic_removal}{Whether to automatically remove autocorrelations}

\item{round_p}{Convenience parameter for automatic rounding of p-values}

\item{plot}{Whether to plot correlations for predictors with significant impact}

\item{aic_bic}{Whether to apply AIC and BIC difference in addition to ANOVA to determine if model is better/worse than ancestor}

\item{correlation_method}{The method used for correlation calculation}

\item{glm_iter}{The number of max iterations used for the glm calculation}
}
\value{
An edited list of coefficients where autocorrelated variables are removed (according to sorted list of coefficients)
}
\description{
Optimize model by removing autocorrelations and variables that do not signicantly predict response variable
}
\examples{
data("dataset_info");
coefficients <- c('val_min_gene_length', 'val_max_gene_length',
                  'train_min_gene_length', 'train_max_gene_length',
                  'train_num_samples', 'val_num_samples',
                  'mean_gene_length', 'val_mean_gene_length',
                  'train_mean_gene_length');
optimize_model(dataset_info, "species_confusion", coefficients, automatic_removal = TRUE);
}
