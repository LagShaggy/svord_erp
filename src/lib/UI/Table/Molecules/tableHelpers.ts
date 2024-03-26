// get the keys of the
export const getKeys = (item: any | null) => {
	return Object.keys(item)
}

export const getColourForIndex = (i: number): string => {
	const colours = ['bg-blue-50', 'bg-white']
	return colours[i % 2]
}
