docker exec schemaregistry curl -X POST    -H "Content-Type: application/vnd.schemaregistry.v1+json"    --tlsv1.2    --cacert /etc/kafka/secrets/snakeoil-ca-1.crt    --data '{ "schema": "{\"type\":\"record\",\"name\":\"recentchange\",\"namespace\":\"mediawiki\",\"fields\":[{\"name\":\"BYTECHANGE\",\"type\":[\"null\",\"long\"],\"default\":null},{\"name\":\"bot\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_bot)\"}],\"default\":null},{\"name\":\"comment\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_comment)\"}],\"default\":null},{\"name\":\"id\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"ID of the recentchange event (rcid).\"}],\"default\":null},{\"name\":\"length\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"length\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"new\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_new_len)\"}],\"default\":null},{\"name\":\"old\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_old_len)\"}],\"default\":null}],\"connect.doc\":\"Length of old and new change\",\"connect.name\":\"properties.length\"}],\"default\":null},{\"name\":\"log_action\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_log_action)\"}],\"default\":null},{\"name\":\"log_action_comment\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"log_id\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_log_id)\"}],\"default\":null},{\"name\":\"log_type\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_log_type)\"}],\"default\":null},{\"name\":\"meta\",\"type\":{\"type\":\"record\",\"name\":\"meta\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"domain\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Domain the event or entity pertains to\"}],\"default\":null},{\"name\":\"dt\",\"type\":{\"type\":\"long\",\"connect.doc\":\"Event datetime, in ISO-8601 format\",\"connect.name\":\"org.apache.kafka.connect.data.Timestamp\",\"connect.version\":1,\"logicalType\":\"timestamp-millis\"}},{\"name\":\"id\",\"type\":{\"type\":\"string\",\"connect.doc\":\"Unique ID of this event\"}},{\"name\":\"request_id\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Unique ID of the request that caused the event\"}],\"default\":null},{\"name\":\"stream\",\"type\":{\"type\":\"string\",\"connect.doc\":\"Name of the stream/queue/dataset that this event belongs in\"}},{\"name\":\"uri\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Unique URI identifying the event or entity\"}],\"default\":null}],\"connect.name\":\"properties.meta\"}},{\"name\":\"minor\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_minor).\"}],\"default\":null},{\"name\":\"namespace\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"ID of relevant namespace of affected page (rc_namespace, page_namespace). This is -1 (\\\"Special\\\") for log events.\\n\"}],\"default\":null},{\"name\":\"parsedcomment\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"The rc_comment parsed into simple HTML. Optional\"}],\"default\":null},{\"name\":\"patrolled\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_patrolled). This property only exists if patrolling is supported for this event (based on $wgUseRCPatrol, $wgUseNPPatrol).\\n\"}],\"default\":null},{\"name\":\"revision\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"revision\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"new\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_last_oldid)\"}],\"default\":null},{\"name\":\"old\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_this_oldid)\"}],\"default\":null}],\"connect.doc\":\"Old and new revision IDs\",\"connect.name\":\"properties.revision\"}],\"default\":null},{\"name\":\"server_name\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgServerName\"}],\"default\":null},{\"name\":\"server_script_path\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgScriptPath\"}],\"default\":null},{\"name\":\"server_url\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgCanonicalServer\"}],\"default\":null},{\"name\":\"timestamp\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"Unix timestamp (derived from rc_timestamp).\"}],\"default\":null},{\"name\":\"title\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Full page name, from Title::getPrefixedText.\"}],\"default\":null},{\"name\":\"type\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Type of recentchange event (rc_type). One of \\\"edit\\\", \\\"new\\\", \\\"log\\\", \\\"categorize\\\", or \\\"external\\\". (See Manual:Recentchanges table#rc_type)\\n\"}],\"default\":null},{\"name\":\"user\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_user_text)\"}],\"default\":null},{\"name\":\"wiki\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"wfWikiID ($wgDBprefix, $wgDBname)\"}],\"default\":null}]}"}'    -u superUser:superUser    https://schemaregistry:8085/subjects/WIKIPEDIANOBOT-value/versions
docker exec schemaregistry curl -X POST    -H "Content-Type: application/vnd.schemaregistry.v1+json"    --tlsv1.2    --cacert /etc/kafka/secrets/snakeoil-ca-1.crt    --data '{ "schema": "{\"type\":\"record\",\"name\":\"recentchange\",\"namespace\":\"mediawiki\",\"fields\":[{\"name\":\"BYTECHANGE\",\"type\":[\"null\",\"long\"],\"default\":null},{\"name\":\"bot\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_bot)\"}],\"default\":null},{\"name\":\"comment\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_comment)\"}],\"default\":null},{\"name\":\"id\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"ID of the recentchange event (rcid).\"}],\"default\":null},{\"name\":\"length\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"length\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"new\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_new_len)\"}],\"default\":null},{\"name\":\"old\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_old_len)\"}],\"default\":null}],\"connect.doc\":\"Length of old and new change\",\"connect.name\":\"properties.length\"}],\"default\":null},{\"name\":\"log_action\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_log_action)\"}],\"default\":null},{\"name\":\"log_action_comment\",\"type\":[\"null\",\"string\"],\"default\":null},{\"name\":\"log_id\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_log_id)\"}],\"default\":null},{\"name\":\"log_type\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_log_type)\"}],\"default\":null},{\"name\":\"meta\",\"type\":{\"type\":\"record\",\"name\":\"meta\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"domain\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Domain the event or entity pertains to\"}],\"default\":null},{\"name\":\"dt\",\"type\":{\"type\":\"long\",\"connect.doc\":\"Event datetime, in ISO-8601 format\",\"connect.name\":\"org.apache.kafka.connect.data.Timestamp\",\"connect.version\":1,\"logicalType\":\"timestamp-millis\"}},{\"name\":\"id\",\"type\":{\"type\":\"string\",\"connect.doc\":\"Unique ID of this event\"}},{\"name\":\"request_id\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Unique ID of the request that caused the event\"}],\"default\":null},{\"name\":\"stream\",\"type\":{\"type\":\"string\",\"connect.doc\":\"Name of the stream/queue/dataset that this event belongs in\"}},{\"name\":\"uri\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Unique URI identifying the event or entity\"}],\"default\":null}],\"connect.name\":\"properties.meta\"}},{\"name\":\"minor\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_minor).\"}],\"default\":null},{\"name\":\"namespace\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"ID of relevant namespace of affected page (rc_namespace, page_namespace). This is -1 (\\\"Special\\\") for log events.\\n\"}],\"default\":null},{\"name\":\"parsedcomment\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"The rc_comment parsed into simple HTML. Optional\"}],\"default\":null},{\"name\":\"patrolled\",\"type\":[\"null\",{\"type\":\"boolean\",\"connect.doc\":\"(rc_patrolled). This property only exists if patrolling is supported for this event (based on $wgUseRCPatrol, $wgUseNPPatrol).\\n\"}],\"default\":null},{\"name\":\"revision\",\"type\":[\"null\",{\"type\":\"record\",\"name\":\"revision\",\"namespace\":\"properties\",\"fields\":[{\"name\":\"new\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_last_oldid)\"}],\"default\":null},{\"name\":\"old\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"(rc_this_oldid)\"}],\"default\":null}],\"connect.doc\":\"Old and new revision IDs\",\"connect.name\":\"properties.revision\"}],\"default\":null},{\"name\":\"server_name\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgServerName\"}],\"default\":null},{\"name\":\"server_script_path\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgScriptPath\"}],\"default\":null},{\"name\":\"server_url\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"$wgCanonicalServer\"}],\"default\":null},{\"name\":\"timestamp\",\"type\":[\"null\",{\"type\":\"long\",\"connect.doc\":\"Unix timestamp (derived from rc_timestamp).\"}],\"default\":null},{\"name\":\"title\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Full page name, from Title::getPrefixedText.\"}],\"default\":null},{\"name\":\"type\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"Type of recentchange event (rc_type). One of \\\"edit\\\", \\\"new\\\", \\\"log\\\", \\\"categorize\\\", or \\\"external\\\". (See Manual:Recentchanges table#rc_type)\\n\"}],\"default\":null},{\"name\":\"user\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"(rc_user_text)\"}],\"default\":null},{\"name\":\"wiki\",\"type\":[\"null\",{\"type\":\"string\",\"connect.doc\":\"wfWikiID ($wgDBprefix, $wgDBname)\"}],\"default\":null}]}"}'    -u superUser:superUser    https://schemaregistry:8085/subjects/WIKIPEDIABOT-value/versions
docker exec schemaregistry curl -X POST    -H "Content-Type: application/vnd.schemaregistry.v1+json"    --tlsv1.2    --cacert /etc/kafka/secrets/snakeoil-ca-1.crt    --data '{ "schema": "{\"type\":\"record\",\"name\":\"WikiFeedMetric\",\"namespace\":\"io.confluent.demos.common.wiki\",\"fields\":[{\"name\":\"domain\",\"type\":\"string\",\"doc\":\"Associated domain\"},{\"name\":\"editCount\",\"type\":\"long\",\"doc\":\"The count of edits for the domain\"}]}"}' -u superUser:superUser    https://schemaregistry:8085/subjects/wikipedia.parsed.count-by-domain-value/versions