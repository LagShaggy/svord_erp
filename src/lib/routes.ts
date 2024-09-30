export const ROUTES = {
	HOME: '/',
	PROFILE: '/profile',
	ORG: '/organisation',
	AUTH: {
		LOGIN: '/auth/login',
		REGISTER: '/auth/register',
		RESET: '/auth/reset'
	},
	PRODUCT: {
		SINGLE: '/products/item/'
	},
	PEOPLE: {
		SINGLE: '/products/item/'
	}
}

export const ACTIONS = {
	AUTH: {
		LOGIN: '/auth/login?/login',
		LOGOUT: '/auth/logout?/logout'
	},
	ACCOUNT: {
		CREATE: '/people?/createAccount'
	},
	CONTACT: {
		CREATE: '/people?/createContact'
	},
	PRODUCT: {
		UPLOADIMAGE: '/products/item?/uploadImage',
		UPLOADDOC: '/products/item?/uploadDoc'
	}
}

export const STORAGE = {
	IMAGES: 'images'
}

export const TABLES = {
	PRODUCT: 'Product',
	PRODUCT_IMAGE: 'product_image'
}
