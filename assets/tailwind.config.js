// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require('tailwindcss/plugin')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  safelist: [
    'lg:col-span-2',
    'lg:col-span-3',
    {
      pattern: /bg-(brick|sun|aqua|nothing)-cover/,
    },
    {
      pattern: /text-(brick|sun|aqua|nothing)-(primary|secondary)/,
    }
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          '"Helvetica Neue"'
        ]
      },
      colors: {
        brick: {
          cover: "#FF4937",
          primary: "#231F20",
          secondary: "#FFF",
        },
        sun: {
          cover: "#FAFF00",
          primary: "#00FFFF",
          secondary: "#FFF",
        },
        aqua: {
          cover: "#001AFF",
          primary: "#FF0000",
          secondary: "#FFF",
        },
        nothing: {
          cover: "#FFF",
          primary: "#231F20",
          secondary: "#FAFF00",
        },
        "blue-clue": "#00FFFF",
        "yellow-fellow": "#FAFF00",
        "dark-park": "#231F20",
        "aqua-dope": "#001AFF",
        "orange-range": "#FF4937",
        "red-bread": "#FF0000",
      },
      animation: {
        'bounce-x': 'bounce-x 1s infinite'
      },
      keyframes: {
        'bounce-x': {
          '0%, 100%': { transform: 'translateX(-25%)', 'animation-timing-function': 'cubic-bezier(0.8, 0, 1, 1)' },
          '50%': { transform: 'translateX(0)', 'animation-timing-function': 'cubic-bezier(0, 0, 0.2, 1)' },
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    plugin(({addVariant}) => addVariant('phx-no-feedback', ['&.phx-no-feedback', '.phx-no-feedback &'])),
    plugin(({addVariant}) => addVariant('phx-click-loading', ['&.phx-click-loading', '.phx-click-loading &'])),
    plugin(({addVariant}) => addVariant('phx-submit-loading', ['&.phx-submit-loading', '.phx-submit-loading &'])),
    plugin(({addVariant}) => addVariant('phx-change-loading', ['&.phx-change-loading', '.phx-change-loading &']))
  ]
}
