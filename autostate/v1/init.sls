{%- set stateorder = {} %}
{%- for statename, state in salt.pillar.get('autostate:states', {}).items() if state.get('enabled', true) == true %}
{%-   do stateorder.setdefault(state.get('priority', 1000), []).append(statename) %}
{%- endfor %}

{%- set prios = stateorder | sort %}
{%- if stateorder | length > 0 %}
include:
{%- for prio in prios %}
# state prio: {{ prio }}
{%-   for state in stateorder.get(prio) %}
 - {{ state }}
{%-   endfor %}
{%- endfor %}

autostate applied:
  test.nop
{%- else %}
no autostate:
  test.nop
{%- endif %}
