{% set p = salt['pillar.get']('kafka', {}) %}
{% set pc = p.get('config', {}) %}
{% set g = salt['grains.get']('kafka', {}) %}
{% set gc = g.get('config', {}) %}

{%- set java_home         = salt['grains.get']('java_home', salt['pillar.get']('java_home', '/usr/lib/java')) %}

{%- set jvm_opts = p.get('jvm_opts', []) %}

{%- set heap_initial_size = gc.get('heap_initial_size', pc.get('heap_initial_size', '1G')) %}
{%- set heap_max_size = gc.get('heap_max_size', pc.get('heap_max_size', '1G')) %}

{%- set broker_id = gc.get('broker_id', pc.get('broker_id', None)) %}
{%- set chroot_path = gc.get('chroot_path', pc.get('chroot_path', 'kafka')) %}

{%- set restart_on_config_change = pc.get('restart_on_config_change', False) %}

{%- set config_properties = gc.get('properties', pc.get('properties', {})) %}

{%- set num_partitions = gc.get('num_partitions', pc.get('num_partitions', 1)) %}

{%- set log_dirs = gc.get('log_dirs', pc.get('log_dirs', '/var/log/kafka')) %}

{%- set jmx_port = gc.get('jmx_port', pc.get('jmx_port', '')) %}

{%- set listeners = gc.get('listeners', pc.get('listeners', '')) %}

{%- set retention_hours = gc.get('retention_hours', pc.get('retention_hours', 168)) %}

{%- set kafka = {} %}
{%- do kafka.update({
  'java_home'                : java_home,
  'jvm_opts'                 : jvm_opts,
  'heap_initial_size'        : heap_initial_size,
  'heap_max_size'            : heap_max_size,
  'broker_id'                : broker_id,
  'chroot_path'              : chroot_path,
  'restart_on_config_change' : restart_on_config_change,
  'config_properties'        : config_properties,
  'num_partitions'           : num_partitions,
  'log_dirs'                 : log_dirs,
  'jmx_port'                 : jmx_port,
  'listeners'                : listeners,
  'retention_hours'          : retention_hours,
}) %}
