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
      pattern: /bg-(brick|sun|aqua|nothing)-default/,
    },
    {
      pattern: /text-(brick|sun|aqua|nothing)-(primary|secondary|accent)/,
      variants: ['hover', 'group-hover'],
    },
    {
      pattern: /fill-(brick|sun|aqua|nothing)-(tertiary|accent)/,
      variants: ['group-hover'],
    },
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
          default: "#FF4937",
          primary: "#231F20",
          secondary: "#FFF",
          tertiary: "#FAFF00",
          accent: "#231F20",
        },
        sun: {
          default: "#FAFF00",
          primary: "#FFF",
          secondary: "#231F20",
          tertiary: "#00FFFF",
          accent: "#FFF",
        },
        aqua: {
          default: "#001AFF",
          primary: "#FF0000",
          secondary: "#FFF",
          tertiary: "#00FFFF",
          accent: "#FF0000",
        },
        nothing: {
          default: "#FFF",
          primary: "#FAFF00",
          secondary: "#231F20",
          tertiary: "#00FFFF",
          accent: "#FAFF00",
        },
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
