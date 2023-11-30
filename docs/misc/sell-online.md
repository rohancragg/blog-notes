---
title: Selling online
description: Using PayPal to sell things online
hero: Using PayPal to sell things online
date: 2023-11-30
authors:
    - Rohan Cragg
og_title: Using PayPal to sell things online
page_path: misc/
og_image: media/sell-online.png
---

This page demonstrates a 'Buy Now' button using PayPal

## The button...

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
  <input type="hidden" name="cmd" value="_s-xclick" />
  <input type="hidden" name="hosted_button_id" value="77PK8YSBLJJKW" />
  <input type="hidden" name="currency_code" value="GBP" />
  <input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Buy Now" />
</form>