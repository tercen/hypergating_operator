FROM tercen/runtime-r40:4.0.4

COPY . /operator
WORKDIR /operator

# Install hypergate package and dependencies
RUN R -e "install.packages(c('dplyr', 'tidyr', 'tibble', 'hypergate'), repos='https://cloud.r-project.org/')"

ENV TERCEN_SERVICE_URI="http://tercen:5400/"

ENTRYPOINT ["R", "--no-save", "--no-restore", "--no-environ", "--slave", "-f", "main.R", "--args"]
CMD ["--taskId", "someid", "--serviceUri", "http://tercen:5400/"]