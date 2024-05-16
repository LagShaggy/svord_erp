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
				primary: {
					50: '#DEF1FC',
					100: '#C2E5FA',
					200: '#84CCF5',
					300: '#47B2F0',
					400: '#1193DE',
					500: '#0D6AA1',
					600: '#084263',
					700: '#031926',
					800: '#021018',
					900: '#01090E',
					950: '#000305'
				},
				secondary: {
					50: '#FFFCF5',
					100: '#FFF9EB',
					200: '#FFF3D6',
					300: '#FFEDC2',
					400: '#FFE7AD',
					500: '#FFE099',
					600: '#FFDA85',
					700: '#FFD46E',
					800: '#F5AB00',
					900: '#7A5600',
					950: '#3D2B00'
				},
				primaryhelper: {
					50: '#EBF4FA',
					100: '#DAECF6',
					200: '#B5D9ED',
					300: '#90C5E4',
					400: '#68B0DA',
					500: '#449DD1',
					600: '#2B7FB0',
					700: '#216287',
					800: '#16415A',
					900: '#0B212D',
					950: '#050F14'
				},
				white: '#F5FCFF',
				'primary-colour': '#4338ca'
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
