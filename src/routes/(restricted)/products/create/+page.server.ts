import { fail } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data, error } = await supabase.from('Product_Category').select()
	if (error) {
		console.log(error)
	}
	return { categories: data }
}

export const actions: Actions = {
	createProduct: async ({ request, locals: { supabase } }) => {
		console.log('creating product form')

		const formData = await request.formData()
		console.log(formData)

		const name = formData.get('name') as string
		const description = formData.get('description') as string
		const category = formData.get('product_category') as string

		const product = {
			name,
			description,
			category
		}
		const { error } = await supabase
			.from('Product')
			.insert({ ...product })
			.select()

		if (error) {
			console.log(error)
			return fail(400, { name, description, category, error })
		}
	},

	createProductCategory: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData()
		const categoryName = formData.get('newCategory') as string
		console.log('creating category form')

		if (categoryName.trim() == '') {
			fail(400, { categoryName, error: { message: 'Category Name cant be an Empty String' } })
		}
		const { error } = await supabase
			.from('Product_Category')
			.insert([{ name: categoryName, colour_hex: '' }])
			.select()

		if (error) {
			return fail(400, { category: categoryName, error })
		}
	}
}
