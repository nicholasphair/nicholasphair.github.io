---
layout: page
title: in-memory
permalink: /in-memory/
description: >
  Inspired by the traditions of Día de Muertos I wanted to honor those family
  and friends - furry and not - who are no longer with us. This page serves as
  an altar so we may never forget them.
nav: true
horizontal: false
---

<div class="projects">
  <!-- Display projects without categories -->
    {% assign sorted_memorials = site.in-memory | sort: "value" %}
    <!-- Generate cards for each project -->
    {% if page.horizontal %}
      <div class="container">
        <div class="row row-cols-2">
        {% for memorial in sorted_memorials %}
          {% include memorials_horizontal.html %}
        {% endfor %}
        </div>
      </div>
    {% else %}
      <div class="grid">
        {% for memorial in sorted_memorials %}
          {% include memorials.html %}
        {% endfor %}
      </div>
    {% endif %}

</div>
