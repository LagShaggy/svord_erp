<script lang="ts">
	import type { MouseEventHandler } from 'svelte/elements'
	import { writable, type Stores, type Writable, derived } from 'svelte/store'

	const MAX_INDECES = 9

	const getCurrentStore = (i: number, max: number) => {
		const store = writable<number>(i)
		return {
			...store,
			back: () => {
				store.update((n) => (n - 1 > 0 ? n - 1 : 1))
			},
			backTen: () => {
				store.update((n) => (n - 10 > 0 ? n - 10 : 1))
			},
			forward: () => {
				store.update((n) => (n + 1 > max ? max : n + 1))
			},
			forwardTen: () => {
				store.update((n) => (n + 10 > max ? max : n + 10))
			}
		}
	}

	export let maxPages: number
	let current = getCurrentStore(1, maxPages)

	// such that parent understand what the current page is
	export let currentIndex = $current
	$: currentIndex = $current

	export let navigationCallback: () => void = () => {}
	export let className: string = ''

	let nearestIndices: number[]
	$: nearestIndices = getNearestIndicesArray($current)

	/**
	 * Calculates the indexes that we want to show
	 * @param current
	 */
	const getNearestIndicesArray = (current: number) => {
		let array: number[] = []
		const halfSize = Math.floor(MAX_INDECES / 2)

		let start
		let stop
		//initialize when we are too small
		if (maxPages <= MAX_INDECES) {
			start = 1
			stop = maxPages
		}
		//when we are at in between 1 and halfSize
		else if (current <= halfSize) {
			start = 1
			stop = MAX_INDECES
		}
		//if we nearing the end of the array
		else if (current + halfSize > maxPages) {
			start = maxPages - MAX_INDECES + 1
			stop = maxPages
		}
		// we are in the middle
		else {
			start = current - halfSize
			stop = current + halfSize
		}
		for (let i = start; i <= stop; i++) {
			array.push(i)
		}
		return array
	}

	const selectPage = (page: number) => {
		return (event: MouseEvent) => {
			event.target as HTMLElement
			$current = page
			navigationCallback()
		}
	}
</script>

<slot />
<div class="flex flex-row justify-center my-2 {className}">
	<div class="flex flex-row h-8 lg:h-10 bg-secondary-colour bg-opacity-15 rounded-full">
		<button on:click={current.backTen}>
			<img src="/icons/chevrons-left.svg" alt="" />
		</button>
		<button on:click={current.back}>
			<img src="/icons/chevron-left.svg" alt="" />
		</button>
		{#each nearestIndices as index}
			<button
				on:click={selectPage(index)}
				class="aspect-square {index == $current ? 'border border-secondary-colour' : ''}"
			>
				{index}
			</button>
		{/each}
		<button on:click={current.forward}>
			<img src="/icons/chevron-right.svg" alt="" />
		</button>
		<button on:click={current.forwardTen}>
			<img src="/icons/chevrons-right.svg" alt="" />
		</button>
	</div>
</div>
