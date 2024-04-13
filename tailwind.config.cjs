const config = {
	content: [
		'./src/**/*.{html,js,svelte,ts}',
		'./node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}'
	],

	theme: {
		extend: {
			fontFamily: {
				popp: ['Poppins'],
				oswald: ['Oswald']
			},
			colors: {
				'primary-colour': '#4338ca',
				'secondary-colour': '#eab308'
			},
			strokeWidth: {
				5: '5px',
				6: '6px',
				7: '7px',
				8: '8px'
			}
		}
	},
	darkMode: 'class'
}

module.exports = config
