import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = () => {
	// const { data: products, error } = await browserSupabase.from('Product').select(
	// 	`
	// 	id,
	// 	name,
	// 	description,
	// 	category(id, name, colour_hex)
	// 	`
	// )
	// if (error) {
	// 	console.log(error)
	// }
	const products = browserSupabase
		.from('Product')
		.select(
			`
			id,
			name,
			abbreviation,
			description,
			category(id, name, colour_hex)
		`
		)
		.eq('active', true)
	return { products }
}
