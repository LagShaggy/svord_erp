export enum TabContext {
	SELECTED = 'selected',
	INDEX = 'index'
}

export type IndexDistributor = {
	getIndex: () => number
	destroy: () => void
}

export const getIndexDistributor = (): IndexDistributor => {
	let counter = 0
	return {
		getIndex: () => {
			const temp = counter
			counter++
			return temp
		},
		destroy: () => {
			counter = 0
		}
	}
}
