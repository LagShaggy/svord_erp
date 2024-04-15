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

export const API = {
	AUTH: {}
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
	}
}

export const STORAGE = {
	IMAGES: 'images'
}

export const TABLES = {
	PRODUCTS: 'Product'
}
