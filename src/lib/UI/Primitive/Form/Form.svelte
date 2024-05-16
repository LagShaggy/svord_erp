<script lang="ts">
	import { enhance } from '$app/forms'
	import { alertStore } from '$src/lib/Alert/alert'
	import type { SubmitFunction } from '@sveltejs/kit'
	import { setContext } from 'svelte'
	import { writable } from 'svelte/store'

	export let action: string = ''
	export let className: string = ''
	const submitable = writable<boolean[]>([])

	const enhancedFunction: SubmitFunction = ({
		formElement,
		formData,
		action,
		cancel,
		submitter
	}) => {
		// `formElement` is this `<form>` element
		// `formData` is its `FormData` object that's about to be submitted
		// `action` is the URL to which the form is posted
		// calling `cancel()` will prevent the submission
		// `submitter` is the `HTMLElement` that caused the form to be submitted

		return async ({ result, update }) => {
			// `result` is an `ActionResult` object
			// `update` is a function which triggers the default logic that would be triggered if this callback wasn't set
			console.log(result)
			if (result.type == 'success') {
				alertStore.add(result.data?.alert)
			}
			await update()
		}
	}

	setContext('sumbit', submitable)
</script>

<form
	method="POST"
	{action}
	{...$$props}
	class="flex justify-center h-full flex-col flex-grow gap-2 mx-auto {className}"
	on:change
	on:input
	use:enhance
>
	<slot />
</form>
