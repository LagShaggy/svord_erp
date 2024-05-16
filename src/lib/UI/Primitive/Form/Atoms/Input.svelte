<script lang="ts">
	import type { HTMLInputTypeAttribute } from 'svelte/elements'
	import { v4 as uuidv4 } from 'uuid'

	export let type: HTMLInputTypeAttribute
	export let name: string
	export let value: string = ''
	export let placeholder: string = ''
	export let className: string = ''

	const id = uuidv4()
</script>

<div class="relative mt-3 w-full">
	<input
		{id}
		{name}
		{type}
		{value}
		{...$$restProps}
		class="user-input w-full text-left bg-inherit border-b border-gray-500 appearance-none
		transition-all duration-400
		focus:border-secondary-700
		invalid:border-red-400
		outline-none {className}"
	/>
	<label
		for={id}
		class="user-label absolute top-0 left-0 pointer-events-none
		duration-200 ease-in-out
		text-gray-400 text-sm"
	>
		<slot />
	</label>
</div>

<style>
	.user-input:active + .user-label,
	.user-input:focus + .user-label,
	.user-input:valid + .user-label {
		transform: translate(-5px, -20px) scale(0.8);
	}
</style>
