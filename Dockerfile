FROM rocker/rstudio:4.4.1

## Set path for cache
ENV RENV_PATHS_CACHE /home/rstudio/.cache/R/renv

# Install renv
RUN Rscript -e 'install.packages("rev")'

# Install project library
WORKDIR /home/pkg
RUN mkdir -p renv
COPY renv.lock .
COPY .Rprofile .
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json
## Restore library
RUN Rscript -e 'renv::restore()'

# Give ownership to rstudio user
RUN chown -R rstudio /home/rstudio
