module ApplicationHelper
  def locale_to_word_flag(locale)
    locales = {
      en: 'English 🇺🇸',
      "zh-TW": 'ZH-TW 🇹🇼'
    }

    locales[locale.to_sym]
  end
end
