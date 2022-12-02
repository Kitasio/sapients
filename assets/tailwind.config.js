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
      pattern: /bg-(pure|morning|wine|mountain|fall|ocean|desert|forest)-default/,
    },
    {
      pattern: /text-(pure|morning|wine|mountain|fall|ocean|desert|forest)-(primary|secondary|accent)/,
      variants: ['hover', 'group-hover'],
    },
    {
      pattern: /fill-(pure|morning|wine|mountain|fall|ocean|desert|forest)-(tertiary|accent|secondary|primary)/,
      variants: ['group-hover', 'lg'],
    },
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          '"Helvetica Neue"', 'ui-sans-serif', 'system-ui', '-apple-system', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', 'Arial', '"Noto Sans"', 'sans-serif', '"Apple Color Emoji"', '"Segoe UI Emoji"', '"Segoe UI Symbol"', '"Noto Color Emoji"'
        ]
      },
      colors: {
        pure: {
          default: "#FFD4E1",
          primary: "#1D5C5C",
          secondary: "#164040",
          tertiary: "#FA4141",
          accent: "#1D5C5C",
        },
        morning: {
          default: "#D7FFE0",
          primary: "#635582",
          secondary: "#373045",
          tertiary: "#913651",
          accent: "#635582",
        },
        wine: {
          default: "#913651",
          primary: "#C4EFFF",
          secondary: "#FFB6C8",
          tertiary: "#FAB641",
          accent: "#C4EFFF",
        },
        mountain: {
          default: "#C4EFFF",
          primary: "#3F4E2C",
          secondary: "#39111D",
          tertiary: "#913651",
          accent: "#3F4E2C",
        },
        fall: {
          default: "#FAB641",
          primary: "#913651",
          secondary: "#39111D",
          tertiary: "#404D30",
          accent: "#913651",
        },
        ocean: {
          default: "#4B6CB7",
          primary: "#D1F3FF",
          secondary: "#091225",
          tertiary: "#FFCB71",
          accent: "#D1F3FF"
        },
        desert: {
          default: "#E2C294",
          primary: "#913651",
          secondary: "#392F20",
          tertiary: "#1D5C5C",
          accent: "#913651"
        },
        forest: {
          default: "#9BE2AE",
          primary: "#164040",
          secondary: "#092323",
          tertiary: "#A73A3A",
          accent: "#164040"
        }
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
