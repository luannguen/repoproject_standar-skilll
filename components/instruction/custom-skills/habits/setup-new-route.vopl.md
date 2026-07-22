# VOPL Habit: Setup New Route (Seed Example)

```vopl
skill SetupNewRoute {

    // Activation Contract
    activates when {
        intent == CreateRoute
        and environment.has(ReactRouter)
        and architecture.has(ThreeLayer)
    }

    requires {
        route_path != empty
        component_name != empty
    }

    predicts {
        route.registered_in_router
        component.created_in_features
        navigation.accessible
    }

    preserves {
        existing.routes.integrity
        app.build.success
    }

    execute {
        step 1: create component skeleton in `src/features/<component_name>/`
        step 2: import component into `src/App.tsx` (or Router file)
        step 3: append `<Route path="<route_path>" element={<<component_name> />} />`
        step 4: run linter
    }

    on prediction_error {
        isolate affected transition
        suspend unsafe action
        request deliberation
    }

    consolidate after {
        success_count >= 1
        success_rate >= 1.0
    }
}
```
