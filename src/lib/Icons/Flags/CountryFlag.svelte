<script lang="ts">
	import { Country } from './countries.enum'

	export let country: Country
	let code = country.toLocaleLowerCase()

	// fi is a library for country flags that is imported in the app.html over cdn
</script>

<span class="fi fi-{code}"></span>
