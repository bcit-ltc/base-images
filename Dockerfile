FROM node:20-buster-slim

RUN set -ex; \
        # apt-get update; \
        # apt-get install -y --no-install-recommends \
        #         git-core \
        #         git-lfs \
        #         ca-certificates \
        #         curl \
        #         jq \
        # ; \
        npm init -y; \
        npm install --save-dev semantic-release @semantic-release/exec; \
        npm audit signatures;


            #   - uses: actions/setup-node@v4
    #     with:
    #       node-version: "lts/*"
    #   - run: npm init -y
    #   - run: npm install --save-dev semantic-release @semantic-release/exec 
    #   - name: Verify the integrity of provenance attestations and registry signatures for installed dependencies
    #     run: npm audit signatures