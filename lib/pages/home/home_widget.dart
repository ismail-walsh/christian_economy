import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/welcome_home.dart';
import '/index.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    this.selectedIndustry,
    this.selectedRegion,
  });

  final String? selectedIndustry;
  final String? selectedRegion;

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.loadBusinesses(context);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Home',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to...',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.sourceSans3(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                  Text(
                    key: ValueKey('Text_zzwp'),
                    'Christian Economy',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.sourceSans3(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ).addWalkthrough(
                    textR9p2mjp1,
                    _model.welcomeHomeController,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: StreamBuilder<List<UsersRow>>(
                            stream: FFAppState().getUserProfile(
                              requestFn: () =>
                                  _model.containerSupabaseStream ??= SupaFlow
                                      .client
                                      .from("users")
                                      .stream(primaryKey: ['id'])
                                      .eqOrNull(
                                        'id',
                                        currentUserUid,
                                      )
                                      .map((list) => list
                                          .map((item) => UsersRow(item))
                                          .toList()),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF7E1416),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UsersRow> containerUsersRowList =
                                  snapshot.data!;

                              final containerUsersRow =
                                  containerUsersRowList.isNotEmpty
                                      ? containerUsersRowList.first
                                      : null;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(ProfileWidget.routeName);
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl:
                                            containerUsersRow?.profilePhoto ?? '',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Container(
                                          color: FlutterFlowTheme.of(context).accent1,
                                          child: Icon(
                                            Icons.person,
                                            color: FlutterFlowTheme.of(context).primary,
                                            size: 40.0,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          color: FlutterFlowTheme.of(context).accent1,
                                          child: Icon(
                                            Icons.person,
                                            color: FlutterFlowTheme.of(context).primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(SearchHomeWidget.routeName);
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 1.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .pushNamed(SearchHomeWidget.routeName);
                                  },
                                  text: 'Search...',
                                  icon: Icon(
                                    Icons.search,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.74,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 200.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0x00677681),
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ).addWalkthrough(
                                  textFieldTqhimnvm,
                                  _model.welcomeHomeController,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 140.0,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: RefreshIndicator(
                onRefresh: () async {
                  // Reload all data
                  await _model.loadBusinesses(context);
                  safeSetState(() {});
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<BusinessRow>>(
                        stream: FFAppState().priorityBusiness(
                          requestFn: () => _model.listViewSupabaseStream ??=
                              SupaFlow.client
                                  .from("business")
                                  .stream(primaryKey: ['id'])
                                  .eqOrNull(
                                    'is_promoted',
                                    true,
                                  )
                                  .map((list) => list
                                      .map((item) => BusinessRow(item))
                                      .toList()),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF7E1416),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<BusinessRow> listViewBusinessRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              0,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewBusinessRowList.length,
                            separatorBuilder: (_, __) => SizedBox(width: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewBusinessRow =
                                  listViewBusinessRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      BusinessDetailsWidget.routeName,
                                      queryParameters: {
                                        'businessId': serializeParam(
                                          listViewBusinessRow.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 190.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: listViewBusinessRow
                                                    .coverPhoto ?? '',
                                                width: 300.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) => Container(
                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                  child: Center(
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                        FlutterFlowTheme.of(context).primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                errorWidget: (context, url, error) => Container(
                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                  child: Icon(
                                                    Icons.business,
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          listViewBusinessRow
                                                              .name,
                                                          'Business Name',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 20,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .sourceSans3(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewBusinessRow
                                                        .location,
                                                    'No location provided',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .sourceSans3(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).addWalkthrough(
                            listViewCamtt8j2,
                            _model.welcomeHomeController,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Filter',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.sourceSans3(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    StickyHeader(
                      overlapHeaders: false,
                      header: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController1 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'All',
                                                ..._model.availableIndustries
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownValue1 = val);
                                                // Reset to null when 'All' is selected to show placeholder
                                                if (val == 'All') {
                                                  _model
                                                      .dropDownValueController1
                                                      ?.reset();
                                                  safeSetState(() => _model
                                                      .dropDownValue1 = null);
                                                }
                                                if ((_model.dropDownValue1 ==
                                                            'All') ||
                                                        (_model.dropDownValue1 ==
                                                                null ||
                                                            _model.dropDownValue1 ==
                                                                '')
                                                    ? true
                                                    : false) {
                                                  if ((_model.dropDownValue2 ==
                                                          'All') ||
                                                      (_model.dropDownValue2 ==
                                                              null ||
                                                          _model.dropDownValue2 ==
                                                              '')) {
                                                    _model.unfilteredCallWoRegion =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) => q,
                                                    );
                                                    if ((_model.unfilteredCallWoRegion !=
                                                                null &&
                                                            (_model.unfilteredCallWoRegion)!
                                                                .isNotEmpty) ==
                                                        true) {
                                                      _model.businessList = _model
                                                          .unfilteredCallWoRegion!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Filter Eroor'),
                                                            content: Text(
                                                                'Whoops, looks like there was an error there. We\'ve set you back to \"All\"'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController1
                                                            ?.value = 'All';
                                                      });
                                                    }
                                                  } else {
                                                    _model.unfilteredCallWRegion =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'region',
                                                        _model.dropDownValue2,
                                                      ),
                                                    );
                                                    if ((_model.unfilteredCallWRegion !=
                                                                null &&
                                                            (_model.unfilteredCallWRegion)!
                                                                .isNotEmpty) ==
                                                        true) {
                                                      _model.businessList = _model
                                                          .unfilteredCallWRegion!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Filter Eroor'),
                                                            content: Text(
                                                                'Whoops, looks like there was an error there. We\'ve set you back to \"All\"'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController1
                                                            ?.value = 'All';
                                                      });
                                                    }
                                                  }
                                                } else {
                                                  if ((_model.dropDownValue2 ==
                                                              null ||
                                                          _model.dropDownValue2 ==
                                                              '') ||
                                                      (_model.dropDownValue2 ==
                                                          'All')) {
                                                    _model.apiResultWoRegion =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'industry',
                                                        _model.dropDownValue1,
                                                      ),
                                                    );
                                                    if (_model.apiResultWoRegion !=
                                                            null &&
                                                        (_model.apiResultWoRegion)!
                                                            .isNotEmpty) {
                                                      _model.businessList = _model
                                                          .apiResultWoRegion!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'No businesses yet'),
                                                            content: Text(
                                                                'No businesses were found in this category'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController1
                                                            ?.value = 'All';
                                                      });
                                                      _model.unfilteredBackupCall1 =
                                                          await BusinessTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      );
                                                      _model.businessList = _model
                                                          .unfilteredBackupCall1!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.apiResultWRegion =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'industry',
                                                            _model
                                                                .dropDownValue1,
                                                          )
                                                          .eqOrNull(
                                                            'region',
                                                            _model
                                                                .dropDownValue2,
                                                          ),
                                                    );
                                                    if (_model.apiResultWRegion !=
                                                            null &&
                                                        (_model.apiResultWRegion)!
                                                            .isNotEmpty) {
                                                      _model.businessList =
                                                          _model
                                                              .apiResultWRegion!
                                                              .toList()
                                                              .cast<
                                                                  BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'No businesses yet'),
                                                            content: Text(
                                                                'No businesses were found in this category'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController1
                                                            ?.value = 'All';
                                                      });
                                                      _model.unfilteredBackupCall2 =
                                                          await BusinessTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      );
                                                      _model.businessList = _model
                                                          .unfilteredBackupCall2!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }

                                                safeSetState(() {});
                                              },
                                              width: 120.0,
                                              height: 35.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.sourceSans3(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Industry',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController2 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'All',
                                                ..._model.availableRegions
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownValue2 = val);
                                                // Reset to null when 'All' is selected to show placeholder
                                                if (val == 'All') {
                                                  _model
                                                      .dropDownValueController2
                                                      ?.reset();
                                                  safeSetState(() => _model
                                                      .dropDownValue2 = null);
                                                }
                                                if ((_model.dropDownValue2 ==
                                                            'All') ||
                                                        (_model.dropDownValue2 ==
                                                                null ||
                                                            _model.dropDownValue2 ==
                                                                '')
                                                    ? true
                                                    : false) {
                                                  if ((_model.dropDownValue1 ==
                                                          'All') ||
                                                      (_model.dropDownValue1 ==
                                                              null ||
                                                          _model.dropDownValue1 ==
                                                              '')) {
                                                    _model.allAllCall =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) => q,
                                                    );
                                                    _model.businessList = _model
                                                        .allAllCall!
                                                        .toList()
                                                        .cast<BusinessRow>();
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.unfilteredRegionCall =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'industry',
                                                        _model.dropDownValue1,
                                                      ),
                                                    );
                                                    if ((_model.unfilteredRegionCall !=
                                                                null &&
                                                            (_model.unfilteredRegionCall)!
                                                                .isNotEmpty) ==
                                                        true) {
                                                      _model.businessList = _model
                                                          .unfilteredRegionCall!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Filter Error'),
                                                            content: Text(
                                                                'Whoops, looks like there was an error there. We\'ve set you back to \"All\"'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController1
                                                            ?.value = 'All';
                                                      });
                                                    }
                                                  }
                                                } else {
                                                  if ((_model.dropDownValue1 ==
                                                          'All') ||
                                                      (_model.dropDownValue1 ==
                                                              null ||
                                                          _model.dropDownValue1 ==
                                                              '')) {
                                                    _model.apiResultRegionAll =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'region',
                                                        _model.dropDownValue2,
                                                      ),
                                                    );
                                                    if (_model.apiResultRegionAll !=
                                                            null &&
                                                        (_model.apiResultRegionAll)!
                                                            .isNotEmpty) {
                                                      _model.businessList = _model
                                                          .apiResultRegionAll!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'No businesses here yet'),
                                                            content: Text(
                                                                'No businesses were found in this region'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController2
                                                            ?.value = 'All';
                                                      });
                                                      _model.unfilteredBackupAllRegionCall =
                                                          await BusinessTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      );
                                                      _model.businessList = _model
                                                          .unfilteredBackupAllRegionCall!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.apiResultRegionInd =
                                                        await BusinessTable()
                                                            .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'industry',
                                                            _model
                                                                .dropDownValue1,
                                                          )
                                                          .eqOrNull(
                                                            'region',
                                                            _model
                                                                .dropDownValue2,
                                                          ),
                                                    );
                                                    if (_model.apiResultRegionInd !=
                                                            null &&
                                                        (_model.apiResultRegionInd)!
                                                            .isNotEmpty) {
                                                      _model.businessList = _model
                                                          .apiResultRegionInd!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'No businesses here yet'),
                                                            content: Text(
                                                                'No businesses were found in this region'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      safeSetState(() {
                                                        _model
                                                            .dropDownValueController2
                                                            ?.value = 'All';
                                                      });
                                                      _model.unfilteredBackupRegionCall =
                                                          await BusinessTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'industry',
                                                          _model.dropDownValue1,
                                                        ),
                                                      );
                                                      _model.businessList = _model
                                                          .unfilteredBackupRegionCall!
                                                          .toList()
                                                          .cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }

                                                safeSetState(() {});
                                              },
                                              width: 120.0,
                                              height: 35.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.sourceSans3(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Region',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ).addWalkthrough(
                              containerBo98dzdm,
                              _model.welcomeHomeController,
                            ),
                          ]
                              .divide(SizedBox(width: 8.0))
                              .addToStart(SizedBox(width: 0.0))
                              .addToEnd(SizedBox(width: 16.0)),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.dropDownValue1,
                                      'All',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.sourceSans3(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  ', ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.sourceSans3(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    (_model.dropDownValue2 == 'All') ||
                                            valueOrDefault<bool>(
                                              _model.dropDownValue2 == null ||
                                                  _model.dropDownValue2 == '',
                                              true,
                                            )
                                        ? 'Global'
                                        : valueOrDefault<String>(
                                            _model.dropDownValue2,
                                            'Region',
                                          ),
                                    'Region',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.sourceSans3(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                              //
                              // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final fullBusinessList =
                                        _model.businessList.toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        44.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: const NeverScrollableScrollPhysics(),
                                      addAutomaticKeepAlives: true,
                                      addRepaintBoundaries: true,
                                      itemCount: fullBusinessList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, fullBusinessListIndex) {
                                        final fullBusinessListItem =
                                            fullBusinessList[
                                                fullBusinessListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                BusinessDetailsWidget.routeName,
                                                queryParameters: {
                                                  'businessId': serializeParam(
                                                    fullBusinessListItem.id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 8.0,
                                                    color: Color(0x1A000000),
                                                    offset: Offset(0.0, 2.0),
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              fullBusinessListItem
                                                                  .coverPhoto ?? '',
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          fit: BoxFit.cover,
                                                          maxHeightDiskCache: 120,
                                                          maxWidthDiskCache: 800,
                                                          memCacheHeight: 120,
                                                          memCacheWidth: 800,
                                                          placeholder: (context, url) => Container(
                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                            child: Center(
                                                              child: SizedBox(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                child: CircularProgressIndicator(
                                                                  strokeWidth: 2.0,
                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                    FlutterFlowTheme.of(context).primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          errorWidget: (context, url, error) => Container(
                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                            child: Icon(
                                                              Icons.image_not_supported,
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        200),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        200),
                                                            imageUrl:
                                                                fullBusinessListItem
                                                                    .photo ?? '',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.fill,
                                                            maxHeightDiskCache: 150,
                                                            maxWidthDiskCache: 150,
                                                            memCacheHeight: 150,
                                                            memCacheWidth: 150,
                                                            placeholder: (context, url) => Container(
                                                              color: FlutterFlowTheme.of(context).accent1,
                                                              child: Icon(
                                                                Icons.business,
                                                                color: FlutterFlowTheme.of(context).primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                            errorWidget: (context, url, error) => Container(
                                                              color: FlutterFlowTheme.of(context).accent1,
                                                              child: Icon(
                                                                Icons.business,
                                                                color: FlutterFlowTheme.of(context).primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      fullBusinessListItem
                                                                          .name,
                                                                      'Business Name',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          38,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.sourceSans3(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      fullBusinessListItem
                                                                          .location,
                                                                      'No location provided',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          30,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.sourceSans3(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (fullBusinessListItem
                                                                        .vacancies ==
                                                                    true)
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          55.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.business_center,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 30.0, 0.0),
                                                                              child: Text(
                                                                                'We\'re Hiring!',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.sourceSans3(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  fullBusinessListItem
                                                                      .industry,
                                                                  'Industry',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .sourceSans3(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ],
                                              ).addWalkthrough(
                                                columnIisrklu0,
                                                _model.welcomeHomeController,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.welcomeHomeController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
