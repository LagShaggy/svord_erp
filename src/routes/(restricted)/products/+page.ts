import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = () => {
	const products = browserSupabase
		.from('product')
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
