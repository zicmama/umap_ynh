#!/bin/bash

# Create a db without password
#
# usage: ynh_mysql_create_user user
# | arg: user - the user name to create
ynh_psql_create_db_without_password() {
	db=$1
	sudo su -c "psql" postgres <<< \
	"CREATE USER $db CREATEDB;"
}

# Create a user
#
# usage: ynh_mysql_create_user user pwd [host]
# | arg: user - the user name to create
# | arg: pwd - the password to identify user by
ynh_psql_create_user() {
	sudo su -c "createuser -s ${1}" postgres
}

# Create a database and grant optionnaly privilegies to a user
#
# usage: ynh_mysql_create_db db [user [pwd]]
# | arg: db - the database name to create
# | arg: user - the user to grant privilegies
# | arg: pwd - the password to identify user by
ynh_psql_create_db() {
	db=$1
	# grant all privilegies to user
	if [[ $# -gt 1 ]]; then
		if [[ $# -lt 3 ]]; then
			ynh_psql_create_user ${2}
		else
			ynh_psql_create_user ${2} "${3}"
		fi
		sudo su -c "createdb -O ${2} $db" postgres
	else
		sudo su -c "createdb $db" postgres
	fi
}

# Create extension
#
# usage: ynh_psql_create_extension db extension
# | arg: extension - the extension name to create
ynh_psql_create_extension() {
	sudo su -c "psql" postgres <<< \
	"CREATE EXTENSION ${1};"
}

# Create role
#
# usage: ynh_psql_create_role role
# | arg: role - the role to create
ynh_psql_create_role() {
	sudo su -c "psql" postgres <<< \
	"CREATE ROLE ${1} WITH LOGIN SUPERUSER PASSWORD '${1}';"
}

# Revoke connect
#
# usage: ynh_psql_revoke_connect user
# | arg: user - the user name to revoke
ynh_psql_revoke_connect() {
	sudo su -c "psql" postgres <<< \
	"REVOKE CONNECT ON DATABASE ${1} FROM GROUP;"
}

# Drop a database
#
# usage: ynh_mysql_drop_db db
# | arg: db - the database name to drop
ynh_psql_drop_db() {
	sudo su -c "psql" postgres <<< \
	"REASSIGN OWNED BY root TO postgres; 
	 DROP OWNED BY root;"
	sudo su -c "dropdb ${1}" postgres
}

# Drop a user
#
# usage: ynh_mysql_drop_user user
# | arg: user - the user name to drop
ynh_psql_drop_user() {
	sudo su -c "dropuser ${1}" postgres
}

# Drop extension
#
# usage: ynh_psql_drop_extension extension
# | arg: extension - the extension to create
ynh_psql_drop_extension() {
	sudo su -c "psql" postgres <<< \
	"DROP EXTENSION ${1};"
}

# Drop role
#
# usage: ynh_psql_drop_role role
# | arg: extension - the role to create
ynh_psql_drop_role() {
	sudo su -c "psql" postgres <<< \
	"DROP ROLE ${1};"
}

# Replace variable umap conf file
#
ynh_replace_config_umap() {
	if test -n "${admin:-}"; then
		ynh_substitute_char "You" "$admin" "$localfile"
		ynh_substitute_char "your@email" "$admin@$domain" "$localfile"
	fi
	if test -n "${secret:-}"; then
		ynh_substitute_char "SECRET_KEY = '!!change me!!'" "SECRET_KEY = '$secret'" "$localfile"
	fi
	if test -n "${final_path:-}"; then
		ynh_substitute_char "STATIC_ROOT = '/home/srv/var/static'" "STATIC_ROOT = '$final_path/static'" "$localfile"
		ynh_substitute_char "MEDIA_ROOT = '/home/srv/umap/var/data'" "MEDIA_ROOT = '$final_path/data'" "$localfile"
	fi
	if test -n "${language:-}"; then
		ynh_substitute_char "LANGUAGE_CODE = 'en'" "LANGUAGE_CODE = '$language'" "$localfile"
	fi
	ynh_substitute_char "UMAP_DEMO_SITE = True" "UMAP_DEMO_SITE = False" "$localfile"

	# Replace variable for Oauth providers
	if test -n "${github_key:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_GITHUB_KEY = 'xxx'" "SOCIAL_AUTH_GITHUB_KEY = '$github_key'" "$localfile"
	fi
	if test -n "${github_secret:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_GITHUB_SECRET = 'xxx'" "SOCIAL_AUTH_GITHUB_SECRET = '$github_secret'" "$localfile"
	fi
	if test -n "${github_scope:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_GITHUB_SCOPE = [\"user:email\", ]" "SOCIAL_AUTH_GITHUB_SCOPE = $github_scope" "$localfile"
	fi

	if test -n "${bitbucket_key:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_BITBUCKET_KEY = 'xxx'" "SOCIAL_AUTH_BITBUCKET_KEY = '$bitbucket_key'" "$localfile"
	fi
	if test -n "${bitbucket_secret:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_BITBUCKET_SECRET = 'xxx'" "SOCIAL_AUTH_BITBUCKET_SECRET = '$bitbucket_secret'" "$localfile"
	fi

	if test -n "${twitter_key:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_TWITTER_KEY = 'xxx'" "SOCIAL_AUTH_TWITTER_KEY = '$twitter_key'" "$localfile"
	fi
	if test -n "${twitter_secret:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_TWITTER_SECRET = 'xxx'" "SOCIAL_AUTH_TWITTER_SECRET = '$twitter_secret'" "$localfile"
	fi

	if test -n "${openstreetmap_key:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_OPENSTREETMAP_KEY = 'xxx'" "SOCIAL_AUTH_OPENSTREETMAP_KEY = '$openstreetmap_key'" "$localfile"
	fi
	if test -n "${openstreetmap_secret:-}"; then
		ynh_substitute_char "SOCIAL_AUTH_OPENSTREETMAP_SECRET = 'xxx'" "SOCIAL_AUTH_OPENSTREETMAP_SECRET = '$openstreetmap_secret'" "$localfile"
	fi
}
