<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('post.total_symbols')  + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('post.total_symbols') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('post.total_time')  + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('post.total_time') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.seo %}
  {% set nofollow = ' rel="external nofollow"' %}
{% endif %}


{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}
