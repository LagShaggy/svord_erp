import { TABLES } from '$src/lib/routes'
import type { PageLoad } from './$types'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'

export const load: PageLoad = async ({ params: { productId } }) => {
	const { data: product, error } = await browserSupabase
		.from(TABLES.PRODUCTS)
		.select(
			`
			id,
			name,
			description,
			category(id, name, colour_hex)
		`
		)
		.eq('id', productId)
		.single()
	if (error) {
		console.log(error)
	}
	return { product }
}
