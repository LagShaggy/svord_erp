// import type { PageServerLoad } from './$types'

// export const load: PageServerLoad = async ({ locals: { supabase } }) => {
// 	// const { data: products, error } = await supabase.from('Product').select(
// 	// 	`
// 	// 	id,
// 	// 	name,
// 	// 	description,
// 	// 	category(id, name, colour_hex)
// 	// 	`
// 	// )
// 	// if (error) {
// 	// 	console.log(error)
// 	// }
// 	const products = supabase.from('Product').select(
// 		`
// 			id,
// 			name,
// 			description,
// 			category(id, name, colour_hex)
// 			`
// 	)
// 	return { products }
// }
