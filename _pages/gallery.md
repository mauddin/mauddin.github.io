---
layout: page
permalink: /gallery/
title: Gallery
description: Photos from talks, awards, and media coverage.
nav: true
nav_order: 8
images:
  spotlight: true # lightbox for the photo cards (al_img_tools)
---

{% comment %} Entries live in _data/gallery.yml; see the notes at the top of that file. {% endcomment %}
{% assign photos = site.data.gallery | sort: "date" | reverse %}
{% assign current_year = "" %}

<div class="gallery spotlight-group">
{% for p in photos %}
{% assign year = p.date | date: "%Y" %}
{% assign img = "/assets/img/gallery/" | append: p.image %}
{% assign alt = p.alt | default: p.title | escape %}
{% capture meta %}{{ p.date | date: "%b %Y" }}{% if p.place %} · {{ p.place }}{% endif %}{% endcapture %}
{% if year != current_year %}
{% unless forloop.first %}</div>{% endunless %}
<h2 class="gallery-year" id="y{{ year }}">{{ year }}</h2>
<div class="gallery-grid">
{% assign current_year = year %}
{% endif %}
<div class="gallery-card">
{% if p.video %}
<a href="{{ p.link }}" class="gallery-thumb focus-{{ p.focus | default: 'center' }}{% if p.fit == 'contain' %} fit-contain{% endif %}" target="_blank" rel="noopener" aria-label="Watch: {{ p.title | escape }}">
{% include figure.liquid path=img alt=alt sizes="(min-width: 992px) 290px, (min-width: 576px) 45vw, 95vw" %}
<span class="gallery-play" aria-hidden="true"><i class="fa-solid fa-play"></i></span>
</a>
{% else %}
<a href="{{ img | relative_url }}" class="spotlight gallery-thumb focus-{{ p.focus | default: 'center' }}{% if p.fit == 'contain' %} fit-contain{% endif %}" data-title="{{ p.title | escape }}" data-description="{{ meta | escape }}{% if p.credit %} · Photo: {{ p.credit | escape }}{% endif %}">
{% include figure.liquid path=img alt=alt sizes="(min-width: 992px) 290px, (min-width: 576px) 45vw, 95vw" %}
</a>
{% endif %}
<p class="gallery-title">{{ p.title }}</p>
<p class="gallery-meta">{{ meta }}</p>
{% if p.credit %}
<p class="gallery-credit">{% if p.video %}Video{% else %}Photo{% endif %}: {% if p.link %}<a href="{{ p.link }}" target="_blank" rel="noopener">{{ p.credit }}</a>{% else %}{{ p.credit }}{% endif %}</p>
{% endif %}
</div>
{% if forloop.last %}</div>{% endif %}
{% endfor %}
</div>
