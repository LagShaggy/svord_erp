<script lang="ts">
	export let countryISO: String
	let code = countryISO.toLocaleLowerCase()

	// fi is a library for country flags that is imported in the app.html
	// and flags are pulled in over CDN
</script>

<span class="fi fi-{code} -z-0"></span>
