FROM ckan/ckan-base:2.10.1

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
COPY patches ${APP_DIR}/patches

RUN for d in $APP_DIR/patches/*; do \
        if [ -d $d ]; then \
            for f in `ls $d/*.patch | sort -g`; do \
                cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
            done ; \
        fi ; \
    done

# TODO: installing from fixes branch. Rewrite using new standard - using pyproject.toml then switch back to main
RUN pip3 install -e 'git+https://github.com/vicding-mi/ckanext-isebel.git@fixes#egg=ckanext-isebel' && \
    pip3 install ckanapi && \
    pip3 install gunicorn

COPY setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh
