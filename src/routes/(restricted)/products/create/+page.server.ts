import { fail, redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import type { Alert } from '$src/lib/Alert/alert'
import { ROUTES } from '$src/lib/routes'

// export const load: PageServerLoad = async ({ locals: { supabase } }) => {
// 	const { data, error } = await supabase.from('Product_Category').select()
// 	console.log(data)
// 	if (error) {
// 		console.log(error)
// 	}
// 	return { categories: data }
// }

export const actions: Actions = {
	createProduct: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData()

		const name = formData.get('name') as string
		const description = formData.get('description') as string
		const category = formData.get('product_category') as string

		if (!category || !name || !description) {
			fail(400, { name, category, description })
		}
		const product = {
			name,
			description,
			category
		}
		const { data, error } = await supabase
			.from('Product')
			.insert({ ...product })
			.select()

		if (error) {
			console.log(error)
			const alert: Alert = {
				type: 'ERROR',
				title: 'Something went wrong',
				message: error.message
			}
			return fail(400, { alert, name, description, category })
		}
		redirect(301, ROUTES.PRODUCT.SINGLE + data[0].id)
	},

	createProductCategory: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData()
		const categoryName = formData.get('newCategory') as string

		if (categoryName.trim() == '') {
			fail(400, { categoryName, error: { message: 'Category Name cant be an Empty String' } })
		}
		const { error } = await supabase
			.from('Product_Category')
			.insert([{ name: categoryName, colour_hex: '' }])
			.select()

		if (error) {
			console.log(error)
			return fail(400, { category: categoryName, error })
		}
	}
}
