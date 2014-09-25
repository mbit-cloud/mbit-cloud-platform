package com.boostrack.platform.admin.team.support;

import org.springframework.social.github.api.GitHub;

interface TeamImporter {
    void importTeamMembers(GitHub gitHub);
}
