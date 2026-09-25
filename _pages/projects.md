---
layout: page
permalink: /projects/
title: Projects
description: Sponsored research projects led as principal investigator (PI) or co-PI, totaling more than $15M, for DOE, USDOT (FHWA, BTS), NYSDOT, and ORNL LDRD.
nav: true
nav_order: 4
---

{% assign groups = "active,completed" | split: "," %}
{% for group in groups %}
{% assign items = site.data.projects | where: "status", group %}

<h2 class="mt-4">{% if group == "active" %}Active{% else %}Completed{% endif %}</h2>
<table class="cv-table">
  <tbody>
    {% for p in items %}
      <tr>
        <td class="year">{{ p.period }}</td>
        <td>
          <strong>{% if p.url %}<a href="{{ p.url }}">{{ p.title }}</a>{% else %}{{ p.title }}{% endif %}</strong><br>
          <span class="detail">{{ p.sponsor }}</span><br>
          <span class="role">{{ p.role }}</span>
        </td>
        <td class="amount">{{ p.amount }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>
{% endfor %}
